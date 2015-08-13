#!jruby
#coding: utf-8

require 'bundler'
Bundler.require

fxml_root File.dirname(__FILE__) + '/ui'
require_relative 'ui/hello_window'

class Main < JRubyFX::Application
  def start(stage)
    # :initializeというオプションに、コントローラのコンストラクタに渡したい引数を配列で指定する
    stage.fxml HelloWindow, :initialize => ['click button ->']
    stage.show
  end
end

Main.launch
