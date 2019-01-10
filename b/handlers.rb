require 'active_support/all'

def show(event:, context:)
  {
    body: event.presence.to_json
  }
end
