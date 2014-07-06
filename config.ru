require 'bundler/setup'

require 'riemann/dash'
require 'riemann/dash/browser_config'
require 'redis'

$redis = Redis.new

class RedisConfigStore
  def read
    $redis.get("riemann-dash-config") || "{}"
  end

  def update(update)
    update = MultiJson.decode update

    # Read old config
    old = MultiJson.decode read

    new = Riemann::Dash::BrowserConfig.merge_configs update, old

    # Save new config
    $redis.set("riemann-dash-config", MultiJson.encode(new, :pretty => true))
  end
end

Riemann::Dash::App.load(nil)
Riemann::Dash::BrowserConfig.backend = RedisConfigStore.new
run Riemann::Dash::App
