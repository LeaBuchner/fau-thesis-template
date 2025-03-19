# FAU Thesis Template
A Typst thesis template designed to simplify writing an engineering thesis at the Open-Source Professorship, Department of Engineering, FAU.

## 🛠️ Setup Guide for FAU Thesis Template  

### ✅ Install Typst  
- **macOS**:  
```bash
brew install typst
```  
- **Windows**:  
```bash
winget install --id Typst.Typst
```  

---

### 📄 Generate Your Thesis PDF  
Navigate to folder 0.1.0, then simply run:  
```bash
typst compile thesis.typ
```
to access incremented compilation use the comand:
```bash
 typst watch thesis.typ 
```
this is faster then recompiling each time.


---

### ✏️ Write Your Thesis  
Open the file:  
```
/0.1.0/metadata.typ
```
and fill in your personal details like:  
- Name  
- Degree program  
- Faculty  
- Other academic information  


In the folder:  
```
/0.1.0/content
```
you can:  
- Add your thesis chapters and sections  
- Browse through example files to see formatting in action

---
### WIP: Acronyms
