#!/usr/bin/env python3
"""
Author : Reetu Tuteja 
Date   : 2021-11-17
"""

my_token = 'xoxe.xoxp-1-Mi0yLTUxMjU0MTg4NjUtMTM5MjgxNzM1MzAwOS0yNzM1MTQ3NzY1OTQxLTI3MzgxMDA5MDA2NzQtOWJiMGRlNGZlMTg2NTAwMzhhNTAxMmViNjc1MmNjMzliOTJjMWQ0MzM5NTAxYzZkMTdlZTdjZDAyMmQ0MGM3ZQ'

import slack
import argparse
from slack.errors import SlackApiError
# --------------------------------------------------
def get_args():
        """Get command-line arguments"""
        parser = argparse.ArgumentParser(
            description='message',
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)

        parser.add_argument('-m',
                            '--message',
                            metavar='message',
                            help='Message you want to send.',
                            type=str,
                            required=True)

        parser.add_argument('-f',
                            '--file',
                            metavar='file',
                            help='File you want to upload.',
                            type=str)

        parser.add_argument('-c',
                            '--channel',
                            metavar='channel',
                            help='Channel you want to post to.',
                            type=str, 
                            default='epitranscriptomics-processing')

        return parser.parse_args()


# --------------------------------------------------
def main():
        args = get_args()
        client = slack.WebClient(token=my_token)
        client.chat_postMessage(channel=args.channel, 
                                text=args.message)

        if args.file:
                try:

                        response = client.files_upload(channels=args.channel,
                                                file=args.file)
                        assert response["file"]  # the uploaded file

                except SlackApiError as e:
                        # You will get a SlackApiError if "ok" is False
                        assert e.response["ok"] is False
                        assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'
                        print(f"Got an error: {e.response['error']}")



# --------------------------------------------------
if __name__ == '__main__':
        main()
