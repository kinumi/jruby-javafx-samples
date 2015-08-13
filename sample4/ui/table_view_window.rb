#coding: utf-8

class TableViewWindow
  include JRubyFX::Controller

  fxml 'table_view_window.fxml'

  # Javaのクラスを参照するためのモジュール
  # ほんとは共通モジュール的なところで定義するとよさげ
  # サンプルなので適当にここで定義する
  module J
    include_package 'javafx.beans.property'
  end

  # コンストラクタ
  def initialize
    # テーブルに表示する内容
    # JavaのObservableListを設定する
    @table.items = FXCollections.observable_list([])

    # Columnごとに、CellValueFactoryを設定する
    # JavaのサンプルではPropertyValueFactoryを使っていることが多いが、
    # JRubyだとうまくいかない。lambdaやProc.newなどで、自前で実装してやる必要があった
    # (もっとうまいやりかたがあるかもしれない。。)
    @col_name.cell_value_factory = lambda {|v| v.value.name }
    @col_address.cell_value_factory = lambda {|v| v.value.address }
    @col_tel.cell_value_factory = lambda {|v| v.value.tel }

    # とりあえずダミーデータを1000件分登録してみる
    Faker::Config.locale = :ja
    1000.times do
      name = Faker::Name.name
      address = Faker::Address.state + ' ' + Faker::Address.city + ' ' + Faker::Address.building_number
      tel = Faker::PhoneNumber.phone_number
      @table.items << TableRecord.new(name, address, tel)
    end
  end

  # テーブル1レコードぶんのデータクラス
  class TableRecord
    attr_reader :name
    attr_reader :address
    attr_reader :tel

    def initialize(name, address, tel)
      @name = J::SimpleStringProperty.new(name)
      @address = J::SimpleStringProperty.new(address)
      @tel = J::SimpleStringProperty.new(tel)
    end
  end
end
