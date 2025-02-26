#
# Cookbook:: subversion
# Recipe:: default
#
# Copyright:: 2012, OpenStreetMap Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apache"

apache_module "rewrite"

ssl_certificate "svn.openstreetmap.org" do
  domains ["svn.openstreetmap.org", "svn.osm.org"]
  notifies :reload, "service[apache2]"
end

apache_site "svn.openstreetmap.org" do
  template "apache.erb"
  variables :aliases => ["svn.osm.org"]
end
