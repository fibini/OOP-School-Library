require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @trim = @nameable.correct_name.chars
    @trim.slice(0, 10).join if @trim.length > 10
  end
end
