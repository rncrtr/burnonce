module EmailsHelper

  def htmlify(body)
    pipeline_context = { gfm: false }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      #HTML::Pipeline::AbsoluteSourceFilter,
      #HTML::Pipeline::AutolinkFilter,
      #HTML::Pipeline::ImageMaxWidthFilter,
      #HTML::Pipeline::EmailReplyFilter,
      HTML::Pipeline::SanitizationFilter,
    ], pipeline_context
    pipeline.call(body)[:output].to_s.html_safe
  end
end
