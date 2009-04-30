namespace :live do
  desc "check all the links (todo)"
  task :check_links do
    puts "todo"
  end
end

namespace :publish do
  desc "prepare everything for publishing"
  task :prepare do
    %w{POOLPARTY_SRC POOLPARTY_WEB}.each {|env| raise "#{env} required." unless ENV[env]}
    cmds =<<-EOCMD 
pushd $POOLPARTY_SRC &&
rake rerdoc &&
rsync -av $POOLPARTY_SRC/rdoc $POOLPARTY_WEB/site/ &&
git checkout gh-pages &&
pushd $POOLPARTY_WEB &&
staticmatic build . &&
rsync -av $POOLPARTY_WEB/site/ $POOLPARTY_SRC &&
popd &&
popd
EOCMD
    # cmds.split(/\n/).each{|cmd| puts sh(cmd, :verbose => true)}
    sh cmds
  end
end
