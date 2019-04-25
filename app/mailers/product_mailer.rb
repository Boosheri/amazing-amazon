class ProductMailer < ApplicationMailer
    # To generate a mailer, do:
    # rails g mailer <name-of-mailer>
    #ie: rails g mailer answer_mailer

  # In a Mailer class, the public methods are used to create
  # and send mail. They're similar to actions in a controller.
  
  # To read more about mailers:
  # https://guides.rubyonrails.org/action_mailer_basics.html]

  # To send this mail, do the following:
  # AnswerMailer.hello_world.deliver_now

#   def hello_world
#     mail(
#         to: "nboosheri@gmail.com",
#         from: "info@awesomeanswer.io",
#         # cc and bcc are also available
#         subject: "Hello, World"
#     )
#     end

  # To deliver this mail, do the following:
  # AnswerMailer.new_answer(Answer.last).deliver_now
  def new_product(product)
    # Any instance variable set in a mailer will
    # be available in its rendered templates.
    @product = product
    @product_owner = @product.user

    mail(
      to: @product_owner.email,
      subject: "#{product.user.first_name}, you've posted a product!"
    )
  end
 
  def new_review(review)
    # Any instance variable set in a mailer will
    # be available in its rendered templates.
    @review = review
    @product = review.product
    @product_owner = @product.user

    mail(
      to: @product_owner.email,
      subject: "#{@product.user.first_name}, your product has a new review!"
    )
  end
end


