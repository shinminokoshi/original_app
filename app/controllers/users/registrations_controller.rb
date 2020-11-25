class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # プロフィール画面用のアクションを追加
  def detail
    @user = User.find_by(id: params[:id])
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # ここのコメントアウトを外してリダイレクト先を指定
  # ルートパス名でも良い
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    "/user/#{current_user.id}"
  end
end
