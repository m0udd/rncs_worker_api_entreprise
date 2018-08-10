module DataSource
  module Stock
    module TribunalCommerce
      module Unit
        module Operation
          class ReadFilesMetadata
            class << self
              def call(ctx, raw_stock_files:, **)
                stock_files = raw_stock_files.map do |e|
                  filename = e.split('/').last

                  result = capture_filename_metadata(filename)
                  result[:path] = e
                  result
                end
                ctx[:stock_files] = stock_files
              end

              def capture_filename_metadata(filename)
                if match = filename.match(/\A(\d{4})_(S\d)_(\d{8})_(\d{1,2})_(.+)\.csv\Z/)
                  code_greffe, stock_number, date, run_order, label = match.captures

                  {
                    code_greffe: code_greffe,
                    stock_number: stock_number,
                    run_order: run_order,
                    label: label,
                  }
                else
                  # TODO manage errors
                end
              end
            end
          end
        end
      end
    end
  end
end