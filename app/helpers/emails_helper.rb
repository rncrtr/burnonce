module EmailsHelper

  def htmlify(body)
    pipeline_context = { gfm: true }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter
    ], pipeline_context
    pipeline.call(body)[:output].to_s.html_safe
  end
end
