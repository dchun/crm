class FileImport < ActiveRecord::Base
    mount_uploader :file_path, FileUploader
end
