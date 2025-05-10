class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def update_with_email_confirmation(params)
    self.unconfirmed_email = params[:email] if params[:email].present?
    send_confirmation_instructions if unconfirmed_email.present?
    save(validate: false)
  end
end
