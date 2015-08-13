#!jruby
#coding: utf-8

require 'bundler'
Bundler.require

class Main < JRubyFX::Application
  def start(stage)
    stage.show
  end
end

Main.launch
