from concurrent.futures import ThreadPoolExecutor
import os
import re
import requests

def extract_urls_from_file(file_path):
    """ Extract URLs from a given markdown file, ignoring HTML tags. """
    urls = []
    with open(file_path, 'r', encoding='utf-8') as file:
        for line in file:
            # Find URLs and exclude HTML tags
            found_urls = re.findall(r'http[s]?://[^\s<>"\']+', line)
            urls.extend(found_urls)
    return urls

def check_url(data):
    """ Check if a single URL is valid and print information if it's invalid. """
    url, file_name = data
    try:
        response = requests.head(url, allow_redirects=True)
        if response.status_code != 200:
            print(f"Invalid URL found in {file_name}: {url}")
    except requests.ConnectionError:
        print(f"Invalid URL found in {file_name}: {url}")

def scan_markdown_files(folder_path):
    """ Scan all markdown files in a folder and its subfolders, checking URLs in them. """
    url_checks = []
    for root, dirs, files in os.walk(folder_path):
        for file_name in files:
            if file_name.endswith('.md'):
                file_path = os.path.join(root, file_name)
                urls = extract_urls_from_file(file_path)
                for url in urls:
                    url_checks.append((url, file_name))

    print("Number of URLs to check: {}".format(len(url_checks)))

    # Check URLs in parallel
    with ThreadPoolExecutor() as executor:
        executor.map(check_url, url_checks)

folder_path = 'content'
scan_markdown_files(folder_path)
