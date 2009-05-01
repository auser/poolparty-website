namespace :live do
  desc "check all the links. Checks GITHUB_USER or your user"
  task :check_links do
    linkchecker_bin = `which linkchecker`.strip
    unless $? == 0
      raise "linkchecker utility required. See: http://superb-east.dl.sourceforge.net/sourceforge/linkchecker/LinkChecker-5.0.2.tar.gz"
    end
    github_user = ENV['GITHUB_USER'] || `/usr/bin/github info | grep "You are" | awk {'print $3'}`.strip
    sh "#{linkchecker_bin} -o text -F text --anchors --no-warnings http://#{github_user}.github.com/poolparty/" rescue nil
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
rm -rf rdoc/*
git checkout gh-pages &&
pushd $POOLPARTY_WEB &&
# find $POOLPARTY_WEB/site -type f -name '*.html' -exec rm {} ";" && 
staticmatic build . &&
rsync -av $POOLPARTY_WEB/site/ $POOLPARTY_SRC &&
popd &&
popd
EOCMD
    # cmds.split(/\n/).each{|cmd| puts sh(cmd, :verbose => true)}
    sh cmds
  end
end

