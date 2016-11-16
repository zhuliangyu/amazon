class CallbacksController < ApplicationController
  def twitter
    tt_data=request.env['omniauth.auth']


    user=User.where(provider: 'twitter', uid: tt_data['uid']).first
    unless user
      # user is nil
      #   create a user
      user=User.new
      name=tt_data['info']['name'].split(' ')
      user.first_name=name[0]
      user.last_name=name[1]
      user.password=SecureRandom.hex(32)
      user.api_key='dddd535e0cd129d601aea719735b56ccf676455308c4dc5f1d82a1031c04776c'
      user.uid=tt_data['uid']
      user.provider=tt_data['provider']
      user.token=tt_data['credentials']['token']
      user.secret=tt_data['credentials']['secret']
      user.raw_data=tt_data
      user.save

    else
      # user is not nil
      # sign in
      session[:user_id]=user.id
      redirect_to home_path,notice: "Thanks for your login"


    end


  end

  def facebook

    render json: request.env['omniauth.auth']

  end
end
