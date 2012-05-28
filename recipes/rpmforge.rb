rpmforge_version = node[:rpmforge][:version]
platform_version = node['platform_version'].to_i

execute "add_rpmforge_repo" do
  command "rpm -Uhv http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-#{rpmforge_version}.el#{platform_version}.rf.x86_64.rpm"
  not_if "rpm -qa | grep 'rpmforge-release-#{rpmforge_version}'"
end
