#coding: utf-8

class HelloWindow
  include JRubyFX::Controller

  # 対応するFXMLファイルを、main.rbで設定したfxml_rootからの相対パスで指定する
  fxml 'hello_window.fxml'

  # FXMLのイベントハンドラと同名のメソッドを作っておくと勝手に呼んでくれる
  def on_hello_action
    # FXMLでfx:idを付与したノードはインスタンス変数として参照できる
    @txt_hello.text = 'Hello JRuby + JavaFX!!'
  end
end
