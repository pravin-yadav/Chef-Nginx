#
# Cookbook:: nginx
# Recipe:: default

#Update the package list
execute "apt-get-update" do
    command "sudo apt-get update -y"
  end
  
  #stop Apache server
  service "apache2" do
    action :stop
  end
  
  #install software-properties-common
  execute "apt-install" do
    command "sudo apt -y install software-properties-common"
    user "root"
  end
  
  #add nginx/stable repository
  execute "apt-repository" do
    command "sudo add-apt-repository ppa:nginx/stable"
    user "root"
  end
  
  bash 'install nginx' do
    code <<-EOH
  
          for lock in /var/lib/apt/lists/lock /var/lib/dpkg/lock /var/cache/apt/archives/lock; do
              lock_released="false"
              count=0
              while [ $lock_released == "false" ]; do
                  if fuser -s $lock; then
                      echo "lock $lock in use, retry $count"
                      sleep 10
                      let "count = count + 1"
                  else
                      lock_released="true"
                  fi
              done
              
              echo $count
          done
          apt-get -y install nginx;
      EOH
    user 'root'
  end
  
  #install nginx-extras
  execute "install nginx-extras" do
    command "sudo apt-get -y install nginx-extras"
    user "root"
  end
  
  #update nginx.conf from template
  template "/etc/nginx/nginx.conf" do
    source "nginx.conf.erb"
    owner "root"
    group "root"
    mode '0755'
  end
  
  #creating document root config from template
  template "/etc/nginx/sites-available/default.conf" do
    source "default.erb"
    owner "root"
    group "root"
    mode '0755'
  end
  
  #start nginx server
  service "nginx" do
    action :start
  end
  