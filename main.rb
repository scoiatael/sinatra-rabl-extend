# app.rb
require 'rubygems'
require 'sinatra'
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
#require 'builder'

# Register RABL
Rabl.register!

class A
  attr_accessor :a, :b, :c
end

class Main < Sinatra::Base
  set :views, 'app/views/'

  get '/?' do
    @instance = A.new.tap do |a|
      a.a = 1
      a.b = 2
      a.c = 3
    end

    rabl :'a/a'
  end
end
