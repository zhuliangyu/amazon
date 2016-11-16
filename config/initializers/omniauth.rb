Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "mAAmYVTjITQhINfzAJpH9Z26S", "mRg2POmRug7QrskWuvu8H0uLKMX2oXXv1YxQEoD8yin9IJ8wcE"
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  scope: 'public_profile', display: 'popup'

end