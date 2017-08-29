@echo off
setlocal

title VSCode Dev

pushd %~dp0\..

:: Node modules
if not exist node_modules call .\scripts\npm.bat install

for /f "tokens=2 delims=:," %%a in ('findstr /R /C:"\"nameShort\":.*" product.json') do set NAMESHORT=%%~a
set NAMESHORT=%NAMESHORT: "=%
set NAMESHORT=%NAMESHORT:"=%.exe
set CODE=".build\electron\%NAMESHORT%"
import java.io.*;
import java.net.*;

public class pract6
{
	public static void main (String args[])throws Exception
	{
		ServerSocket ss=new ServerSocket(8081);
		while(true)
			try
			{
				Socket s=ss.accept();
				BufferedReader br=new BufferedReader(new InputStreamReader(s.getInputStream()));
				PrintWriter pr=new PrintWriter(s.getOutputStream());
				String str=null;
				String str1=br.readLine();
				System.out.println(str1);
				while((str=br.readLine())!=null)
				{
					if(str.length()==0)
						break;
					System.out.println(str);
				}
				String str2=str1.substring(str1.indexOf("/")+1);
				String str3=null;
				try
				{
					str3=str2.substring(0,str2.indexOf("?"));
				}
				catch(Exception e)
				{
					str3=str2.substring(0,str2.indexOf(" "));
				}
					BufferedReader br1=new BufferedReader(new FileReader(str3));
					while((str=br1.readLine())!=null)
					{
						System.out.println(str);
						pr.println(str);
					}
					pr.println("</html>");
					pr.close();
					br.close();
					br1.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
	}
}
for /f "tokens=2 delims=:," %%a in ('findstr /R /C:"\"electronVersion\":.*" package.json') do set DESIREDVERSION=%%~a
set DESIREDVERSION=%DESIREDVERSION: "=%
set DESIREDVERSION=v%DESIREDVERSION:"=%
if exist .\.build\electron\version (set /p INSTALLEDVERSION=<.\.build\electron\version) else (set INSTALLEDVERSION="")

:: Get electron
if not exist %CODE% node .\node_modules\gulp\bin\gulp.js electron
if not "%INSTALLEDVERSION%" == "%DESIREDVERSION%" node .\node_modules\gulp\bin\gulp.js electron

:: Build
if not exist out node .\node_modules\gulp\bin\gulp.js compile

:: Configuration
set ELECTRON_RUN_AS_NODE=1
set NODE_ENV=development
set VSCODE_DEV=1
set ELECTRON_DEFAULT_ERROR_MODE=1
set ELECTRON_ENABLE_LOGGING=1
set ELECTRON_ENABLE_STACK_DUMPING=1

:: Launch Code
%CODE% --debug=5874 out\cli.js . %*
popd

endlocal
