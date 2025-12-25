@echo off
setlocal enabledelayedexpansion

set "files=dll-development.html endpoint-policies.html extensions-development.html generic-4gl.html json-parsing.html metadata-generation.html odata-apis.html public-interfaces.html reports-development.html rest-integration.html table-operations.html trusted-functions.html ui-scripts.html usecases-einvoice.html usecases.html xml-parsing.html"

for %%f in (%files%) do (
    echo Updating %%f...
    
    REM Add Prism.js script tags after CSS link
    powershell -Command "(Get-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f') -replace '<link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css\" rel=\"stylesheet\">', '<link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css\" rel=\"stylesheet\">^<link href=\"https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css\" rel=\"stylesheet\">^<script src=\"https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-core.min.js\"></script>^<script src=\"https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/autoloader/prism-autoloader.min.js\"></script>' | Set-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f'"
    
    REM Add language-c class to code elements
    powershell -Command "(Get-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f') -replace '<pre id=\"code-output\" class=\"code-editor\"></pre>', '<pre><code id=\"code-output\" class=\"language-c code-editor\"></code></pre>' | Set-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f'"
    
    REM Add Prism highlighting calls
    powershell -Command "(Get-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f') -replace 'output.textContent \+= code\[currentIndex\];(\s+)currentIndex\+\+;(\s+)output.parentElement.scrollTop = output.scrollHeight;', 'output.textContent += code[currentIndex];$1currentIndex++;$2output.parentElement.scrollTop = output.scrollHeight;$2if (currentIndex %% 100 === 0) Prism.highlightElement(output);' | Set-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f'"
    
    powershell -Command "(Get-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f') -replace 'clearInterval\(typingInterval\);(\s+)isTyping = false;(\s+)isComplete = true;', 'clearInterval(typingInterval);$1isTyping = false;$2isComplete = true;$2Prism.highlightElement(output);' | Set-Content 'C:\Users\pkumar5\workspace\Hyva\narwal [EXTce01096]\Web\%%f'"
)

echo All files updated with Prism.js syntax highlighting!