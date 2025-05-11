enum ExternalLink {
  youTubePlaylist('https://www.youtube.com/playlist?list=PL4dBIh1xps-HIYvaEIbLWHZqt_WGBfpx3'),
  youTubeVibeCoding('https://www.youtube.com/playlist?list=PL4dBIh1xps-GLrzqijiTRuzdtxP3bfqsQ'),
  youTubeAgenticQA('https://www.youtube.com/live/XRuKywXD7zM?si=KHjiSKayFwuFz7GH'),
  forumCategory('https://forum.itsallwidgets.com/c/ai/46'),
  forumChat('https://forum.itsallwidgets.com/chat/c/fc-ai-circle/40'),
  surveyCommunity('https://forms.gle/JrC11pxRz6TLyB2L9'),
  surveyContributors('https://forms.gle/AcoThJ6E9yxxe8hdA'),
  socialBlueSky('https://bsky.app/profile/fluttercommunity.dev'),
  socialTwitterX('https://x.com/FlutterComm'),
  socialMastodon('https://fluttercommunity.social/@FlutterComm'),
  socialGitHub('https://github.com/fluttercommunity/fc_ai_circle'),
  socialMedium('https://medium.com/flutter-community'),
  ;

  const ExternalLink(this.url);

  final String url;
}
