<# 
    Script di installazione dell'agent Sangford Defender Endpoint.

    Autore: Enrico Giacomin
    Data ultima modifica: 20230227

    # DISCLAIMER:
    # THIS CODE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    # THE SOFTWARE.
#>

function checkProcess {
    param (
        [string] $ProcessName
    )
    if ((Get-Process -Name "$ProcessName" -ErrorAction SilentlyContinue ) -eq $null){return $false}
    else {
        return $true
    }
}

# Definizione delle variabili. Modificare in base all'ambiente

$SangforProcessName = "MSEdge"
$installPath        = "C:\windows\notepad.exe"
$logFile            = "c:\windows\temp\SEA.log"

# Script starts. Please do not atler after this line

Start-Transcript -Path $logFile -Append

[boolean] $a = checkProcess -ProcessName "$SangforProcessName"
if ($a){
    Write-Host -ForegroundColor Yellow "Il processo di Sangfor è in esecuzione. Skipping install"
    Stop-Transcript
    break
}

Invoke-Expression -Command $installPath -Verbose
Stop-Transcript
