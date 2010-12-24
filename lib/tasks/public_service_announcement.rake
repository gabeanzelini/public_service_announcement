require 'FileUtils'

namespace 'psa' do
  namespace :migrations do
      desc 'copy all migrations'
      task :copy do
        source = File.join(File.dirname(__FILE__), '..', '..', 'db','migrate')
        destination = File.join(Rails.root, 'db', 'migrate')
        Dir.entries(source).reject{ |s| s =~ %r(^\.+$) }.each do |file|
          FileUtils.cp File.join(source,file), destination
        end
      end
  end
end