#coding: utf-8

class HelloWindow
  include JRubyFX::Controller

  fxml 'hello_window.fxml'

  # コンストラクタを定義しておく
  def initialize(initial_text)
    @txt_hello.text = initial_text
  end

  def on_hello_action
    @txt_hello.text = 'Hello JRuby + JavaFX!!'
  end
end
