s3_on = (Rails.env.development? && ENV['USE_S3_IN_DEVELOPMENT'] == 'true') ||
        (!Rails.env.development? && !Rails.env.test?)

aws_unconfigured = ENV['AWS_ACCESS_KEY_ID'].blank? ||
                  ENV['AWS_SECRET_ACCESS_KEY'].blank? ||
                  ENV['AWS_BUCKET'].blank?

if s3_on
  fail 'Need to set AWS_ACCESS_KEY_ID, '\
       'AWS_SECRET_ACCESS_KEY, and '\
       'AWS_BUCKET in environment.' if aws_unconfigured
  require "refile/backend/s3"
  aws = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    bucket: ENV['AWS_BUCKET'],
  }
  Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
end