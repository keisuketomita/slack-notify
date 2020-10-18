class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  def index #一覧（トップページ）
    @messages = Msg.all
  end
  def new #投稿
    @message = Msg.new
  end
  def confirm #投稿確認
    @message = Msg.new(message_params)
    render :new if @message.invalid?
  end
  def create #DB更新
    @message = Msg.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "メッセージを作成しました"
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @message.update(message_params)
      redirect_to messages_path, notice: "メッセージを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:msg).permit(:content)
  end
  def set_message
    @message = Msg.find(params[:id])
  end
end
