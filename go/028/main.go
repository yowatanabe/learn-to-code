package main

import "fmt"

type File struct {
	Name string
	Type string
}

type Directory struct {
	Name    string
	Files   []File
	SubDirs []Directory
}

func addFileOrDirectory(root Directory, name string, fileType string) Directory {
	if fileType == "file" {
		root.Files = append(root.Files, File{Name: name, Type: fileType})
	} else if fileType == "directory" {
		root.SubDirs = append(root.SubDirs, Directory{Name: name})
	}
	return root
}

func findFileOrDirectory(root Directory, name string) (File, error) {
	for _, file := range root.Files {
		if file.Name == name {
			return file, nil
		}
	}
	for _, dir := range root.SubDirs {
		if dir.Name == name {
			return File{Name: name, Type: "directory"}, nil
		} else {
			if found, err := findFileOrDirectory(dir, name); err == nil {
				return found, nil
			}
		}
	}
	return File{}, fmt.Errorf("ファイルまたはディレクトリが見つかりません")
}

func printFileSystem(root Directory, indent int) {
	for _, file := range root.Files {
		for i := 0; i < indent; i++ {
			fmt.Print("\t")
		}
		fmt.Printf("- %s (%s)\n", file.Name, file.Type)
	}
	for _, dir := range root.SubDirs {
		for i := 0; i < indent; i++ {
			fmt.Print("\t")
		}
		fmt.Printf("- %s (directory)\n", dir.Name)
		printFileSystem(dir, indent+1)
	}
}

func main() {
	rootDir := Directory{Name: "Root"}

	rootDir = addFileOrDirectory(rootDir, "file1", "file")
	rootDir = addFileOrDirectory(rootDir, "dir1", "directory")

	printFileSystem(rootDir, 0)

	result, err := findFileOrDirectory(rootDir, "hogehoge")
	if err != nil {
		fmt.Println("Error:", err)
		return
	} else {
		fmt.Println(result.Name)
		return
	}
}
