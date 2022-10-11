require 'aws-sdk-cloudwatch'

class Cloudwatch
  NAMESPACE = 'Deployments'.freeze

  def initialize(context)
    @context = context
  end

  def put
    client.put_metric_data(
      namespace: NAMESPACE,
      metric_data: metric_data,
    )
  end

  private
  def metric_data
    [
      {
        metric_name: fetch(:application),
        timestamp: Time.now.utc,
        value: 1.0,
        dimensions: dimensions,
        unit: 'None',
        storage_resolution: 60,
      },
    ]
  end

  def dimensions
    dimensions = [
      {
        name: 'environment',
        value: fetch(:rails_env),
      },
    ]
    project = fetch(:project)
    dimensions.push({
      name: 'project',
      value: fetch(:project),
    }) if project
    dimensions
  end

  def client
    @client ||= ::Aws::CloudWatch::Client.new
  end

  def fetch(*args, &block)
    @context.fetch(*args, &block)
  end
end
