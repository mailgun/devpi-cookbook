#
# Cookbook Name:: devpi
# LWRP:: user
#
# Copyright 2013-2014, Dave Shawley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#

require 'json'
require 'net/http'


action :create do
  converge_by("Creating #{@new_resource}") do
    request = Net::HTTP::Put.new("/#{@new_resource.name}")
    request.body = JSON.generate({
      'email' => "#{@new_resource.name}@somewhere.com",
      'password' => 'password'
    })
    response = Net::HTTP.new('localhost', 3141).start do |http|
      http.request(request)
    end
  end
end
