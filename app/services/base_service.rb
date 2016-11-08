class BaseService
  delegate :params, :session, to: :@context
  attr_reader :context

  def initialize(context)
    @context = context
  end
end