require 'json'

module PreserveLabels
  def fetch_labels
    labels_array = []
    labels_file = 'labels.json'
    return labels_array if !File.exist?(labels_file) || File.read(labels_file) == ''

    JSON.parse(File.read(labels_file)).each do |label|
      labels_array << label.new(title: label['title'], color: label['color'])
    end

    labels_array
  end

  def store_labels(labels)
    labels_array = []
    labels.each { |label| labels_array.push({ title: label.title, color: label.color }) }
    File.write('labels.json', JSON.generate(labels_array))
  end
end
