import re

file_path = r'c:\Users\Zubayer Ishfar Zeem\Downloads\Telegram Desktop\farmers_weather_app\farmers_weather_app\lib\krishok_page.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. The comment "// ── Market Price Dashboard (DAM WebView)"
# 2. The function "bool get _canUseWebView => !kIsWeb && (Platform.isAndroid || Platform.isIOS);"
# 3. The entire "_MarketPriceDashboard" class
# 4. The entire "_DamLauncherTile" class

# Helper to remove a class with balanced braces
def remove_class(content, class_name):
    pattern = re.compile(rf'class\s+{class_name}.*?{{')
    match = pattern.search(content)
    if not match:
        return content
    
    start_index = match.start()
    brace_count = 1
    current_index = match.end()
    
    while brace_count > 0 and current_index < len(content):
        if content[current_index] == '{':
            brace_count += 1
        elif content[current_index] == '}':
            brace_count -= 1
        current_index += 1
    
    return content[:start_index] + content[current_index:]

# Remove the comment and the bool function
content = re.sub(r'// ── Market Price Dashboard \(DAM WebView\)', '', content)
content = re.sub(r'bool get _canUseWebView => !kIsWeb && \(Platform\.isAndroid \|\| Platform\.isIOS\);', '', content)

# Remove the classes
content = remove_class(content, '_MarketPriceDashboard')
content = remove_class(content, '_DamLauncherTile')

# Clean up extra newlines if any
content = re.sub(r'\n\s*\n\s*\n', '\n\n', content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Successfully updated krishok_page.dart")
