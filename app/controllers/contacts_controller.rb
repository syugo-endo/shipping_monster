class ContactsController < ApplicationController
  def new
    # binding.pry
    @contact = Contact.new
  end

  def create
    # binding.pry
    @contact = Contact.new(contact_params)
    if @contact.save
      # binding.pry
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
