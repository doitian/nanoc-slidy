require 'nanoc3/tasks'
$: << "lib"

desc "watch for changes and recompile"
task :watch do
  require 'fssm'
  require 'nanoc3'
  require 'nanoc3/cli'
  Nanoc3::NotificationCenter.on(:compilation_started) do |rep|
    puts "Compiling: #{rep.path}"
  end

  rebuild_site = lambda do |base, relative|
    if !relative
      puts ">>> Compiling <<<"
    else
      puts ">>> Change Detected to #{relative} <<<"
    end
    start = Time.now
    site = Nanoc3::Site.new('.')
    site.load_data
    begin
      site.compiler.run
      puts ">>> Done in #{((Time.now - start)*10000).round.to_f / 10}ms <<<"
      system %(growlnotify -m "Compilation Complete" --image misc/success-icon.png 2> /dev/null)
      system %(notify-send -i #{File.expand_path('misc/success-icon.png')} "Compilation Complete" 2> /dev/null)
    rescue Exception => e
      puts ">>> ERROR: #{e.message} <<<"
      puts e.backtrace.join("\n")
      system %(growlnotify -m "Compilation Error!" --image misc/error-icon.png 2> /dev/null)
      system %(notify-send -i #{File.expand_path('misc/success-icon.png')} "Compilation Error!" 2> /dev/null)
    end
  end
  rebuild_site.call(nil,nil)

  puts ">>> Watching for Changes <<<"
  monitor = FSSM::Monitor.new
  monitor.path("#{File.dirname(__FILE__)}/content", '**/*') do
    update(&rebuild_site)
    delete(&rebuild_site)
    create(&rebuild_site)
  end
  monitor.path("#{File.dirname(__FILE__)}/lib", '**/*') do
    update(&rebuild_site)
    delete(&rebuild_site)
    create(&rebuild_site)
  end
  monitor.path("#{File.dirname(__FILE__)}/layouts", '**/*') do
    update(&rebuild_site)
    delete(&rebuild_site)
    create(&rebuild_site)
  end
  monitor.run
end

desc "Deploy to gh-pages"
task :deploy do
  system %(nanoc3 compile)
  system %(git checkout gh-pages)
  Dir['output/*'].each do |f|
    cp_r f, '.'
  end
  system %(git add .)
  system %(git commit -m 'Deploy site')
  system %(git push origin gh-pages)
  system %(git checkout master)
end
