#!jruby
#coding: utf-8

require 'bundler'
Bundler.require

# FXMLを「ui」ディレクトリ以下から探すよう設定する
fxml_root File.dirname(__FILE__) + '/ui'
# コントローラ
require_relative 'ui/hello_window'

class Main < JRubyFX::Application
  def start(stage)
    # stageに表示するfxmlを指定する
    stage.fxml HelloWindow
    stage.show
  end
end

Main.launch
