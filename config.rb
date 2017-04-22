activate :protect_emails
activate :deploy, deploy_method: :git

page '/*.json', layout: false

set :source_uri, 'https://github.com/angeloashmore/resume'

helpers do
  def resume
    data.resume
  end

  def resume_wo_email
    resume.dup.tap { |r| r.basics.email = "[view on website]" }
  end

  def title
    "#{resume.basics.name} - #{resume.basics.label}"
  end

  def last_updated
    File.mtime("./data/resume.yml")
  end

  def basic_date(date)
    date = Date.parse(date) unless date.respond_to?(:strftime)

    date.strftime('%b %Y')
  end
end
