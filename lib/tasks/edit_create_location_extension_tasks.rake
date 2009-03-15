namespace :radiant do
  namespace :extensions do
    namespace :edit_create_location do
      
      desc "Runs the migration of the Edit Create Location extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          EditCreateLocationExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          EditCreateLocationExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Edit Create Location to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from EditCreateLocationExtension"
        Dir[EditCreateLocationExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(EditCreateLocationExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
