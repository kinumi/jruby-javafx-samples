#!jruby
#coding: utf-8

require 'bundler'
Bundler.require

fxml_root File.dirname(__FILE__) + '/ui'
require_relative 'ui/table_view_window'

class Main < JRubyFX::Application
  def start(stage)
    stage.fxml TableViewWindow
    stage.show
  end
end

Main.launch
