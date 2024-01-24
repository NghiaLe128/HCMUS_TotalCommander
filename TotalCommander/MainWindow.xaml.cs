using System;
using System.Collections.Generic;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;


namespace TotalCommander
{
    public partial class MainWindow : Window
    {
        private Stack<string> directoryHistory = new Stack<string>();
        public MainWindow()
        {
            InitializeComponent();

            InitializeDriveComboBox();
        }

        private void InitializeDriveComboBox()
        {
            DriveInfo[] drives = DriveInfo.GetDrives();

            List<string> driveNames = new List<string>();

            foreach (DriveInfo drive in drives)
            {
                driveNames.Add(drive.Name);
            }

            driveComboBox.Items.Clear();

            driveComboBox.ItemsSource = driveNames;

            driveComboBox.SelectedIndex = 0;

            UpdateFileListView(driveComboBox.SelectedItem.ToString());
        }


        private void DriveComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            directoryHistory.Clear();

            currentDirectoryLabel.Content = "Current Directory: " + "";

            UpdateFileListView(driveComboBox.SelectedItem.ToString());
        }

        private void UpdateFileListView(string selectedPath)
        {
            try
            {

                string[] directories = Directory.GetDirectories(selectedPath);
                string[] files = Directory.GetFiles(selectedPath);

                List<FileSystemInfoItem> fileSystemInfoList = new List<FileSystemInfoItem>();

                foreach (string directory in directories)
                {
                    DirectoryInfo directoryInfo = new DirectoryInfo(directory);
                    fileSystemInfoList.Add(new FileSystemInfoItem
                    {
                        FileName = directoryInfo.Name,
                        FileType = "Directory",
                        FileSize = "-", 
                        FileDate = directoryInfo.LastWriteTime.ToString()
                    });
                }

                foreach (string file in files)
                {
                    FileInfo fileInfo = new FileInfo(file);
                    fileSystemInfoList.Add(new FileSystemInfoItem
                    {
                        FileName = fileInfo.Name,
                        FileType = "File",
                        FileSize = $"{fileInfo.Length / 1024} KB", 
                        FileDate = fileInfo.LastWriteTime.ToString()
                    });
                }

                fileListView.ItemsSource = fileSystemInfoList;

                directoryHistory.Push(selectedPath);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error updating file list: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void FileListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

            FileSystemInfoItem selectedItem = (FileSystemInfoItem)fileListView.SelectedItem;

            if (selectedItem != null && selectedItem.FileType == "Directory")
            {
               
                string selectedPath = Path.Combine(directoryHistory.Peek(), selectedItem.FileName);
                UpdateFileListView(selectedPath);

                // Update the current directory label
                currentDirectoryLabel.Content = "Current Directory: " + selectedPath;
            }
        }
        private class FileSystemInfoItem
        {
            public string FileName { get; set; }
            public string FileType { get; set; }
            public string FileSize { get; set; }
            public string FileDate { get; set; }
        }

    }
}
