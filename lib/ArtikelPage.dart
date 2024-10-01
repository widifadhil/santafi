import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:santafi/Article/articleDetailPage.dart';
import 'package:santafi/Article/articlecard.dart';
import 'package:santafi/Footer.dart';
import 'package:santafi/Article/filterbutton.dart';
import 'header.dart'; // Import the Header

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({super.key});

  @override
  _ArtikelPageState createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  int currentPage = 1; // Start on the first page
  int displayedArticleCount = 8;
  int articlesPerPage = 8; // Number of articles to show per page
  String selectedFilter = 'Semua'; // Track the selected filter
  bool isHoveredPrevious = false;
  bool isHoveredNext = false;

  // Function to filter articles based on the selected category
  List<Map<String, dynamic>> getFilteredArticles() {
    if (selectedFilter == 'Semua') {
      return allArticles;
    } else {
      return allArticles
          .where((article) => article['category'] == selectedFilter)
          .toList();
    }
  }

  // Get paginated articles for the current page
  List<Map<String, dynamic>> getPaginatedArticles() {
    List<Map<String, dynamic>> filteredArticles = getFilteredArticles();
    int startIndex = (currentPage - 1) * articlesPerPage;
    int endIndex = startIndex + articlesPerPage;

    // Ensure we don't go out of bounds
    return filteredArticles.sublist(
      startIndex,
      endIndex > filteredArticles.length ? filteredArticles.length : endIndex,
    );
  }

  // Total number of pages
  int get totalPages {
    return (getFilteredArticles().length / articlesPerPage).ceil();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> paginatedArticles = getPaginatedArticles();
    List<Map<String, dynamic>> filteredArticles = getFilteredArticles();
    // Separate the latest article
    final latestArticle =
        filteredArticles.isNotEmpty ? filteredArticles[0] : null;

    // Remaining articles
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(), // Reuse the Header widget here
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Section for the latest article with a new layout
          if (latestArticle != null) ...[
            SizedBox(
              height: 900, // Specify height to constrain the Stack
              child: Stack(
                children: [
                  // Background image layer
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/BannerTentang.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Overlayed content centered
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 86),
                        Text(
                          'INFORMASI DAN INSPIRASI PERJALANAN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Jelajahi beragam informasi bermanfaat \ndan kisah inspiratif perjalanan.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 26),
                        Text(
                          'Temukan wawasan terkini tentang Umrah & Haji, tips wisata halal domestik dan \ninternasional, serta kisah perjalanan menginspirasi di halaman ini!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        // Filter button container
                        Container(
                          width: 570, // Adjust width to fit the filter buttons
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Background color of the filter container
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FilterButton(
                                  label: 'Semua',
                                  isSelected: selectedFilter == 'Semua',
                                  onTap: () {
                                    setState(() {
                                      selectedFilter = 'Semua';
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                FilterButton(
                                  label: 'Haji',
                                  isSelected: selectedFilter == 'Haji',
                                  onTap: () {
                                    setState(() {
                                      selectedFilter = 'Haji';
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                FilterButton(
                                  label: 'Umrah',
                                  isSelected: selectedFilter == 'Umrah',
                                  onTap: () {
                                    setState(() {
                                      selectedFilter = 'Umrah';
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                FilterButton(
                                  label: 'Domestik',
                                  isSelected: selectedFilter == 'Domestik',
                                  onTap: () {
                                    setState(() {
                                      selectedFilter = 'Domestik';
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                FilterButton(
                                  label: 'Mancanegara',
                                  isSelected: selectedFilter == 'Mancanegara',
                                  onTap: () {
                                    setState(() {
                                      selectedFilter = 'Mancanegara';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 98),
                        // Display the latest article with a new layout and navigate to details
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage(imageUrl: latestArticle['imageUrl'],
                                    title: latestArticle['title'],
                                    description: latestArticle['description'],
                                    publishDate: latestArticle['publishDate'],
                                    readCount: latestArticle['readCount'],
                                    category: latestArticle['category'],),
                                ),
                              );

                            },
                            child: Container(
                              width: 1280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Image.asset(
                                      latestArticle['imageUrl'],
                                      height: 500, // Adjust as needed
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            latestArticle['category'],
                                            style: TextStyle(
                                              color: Color(0xFF29C6CF),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat',
                                            ),
                                            maxLines: 2,
                                            minFontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 24),
                                          AutoSizeText(
                                            latestArticle['title'],
                                            style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat',
                                            ),
                                            maxLines: 2,
                                            minFontSize: 30,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4),
                                          AutoSizeText(
                                            latestArticle['description'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 28,
                                              fontFamily: 'Montserrat',
                                            ),
                                            maxLines: 2,
                                            minFontSize: 24,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 55),
                                          Divider(),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                latestArticle['publishDate'],
                                                style: TextStyle(
                                                    color: Color(0xFF333333),
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w200),
                                              ),
                                              SizedBox(width: 16),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.visibility_rounded,
                                                    color: Color(0xFF333333),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                    '${latestArticle['readCount']}',
                                                    style: TextStyle(
                                                        color: Color(0xFF333333),
                                                        fontFamily: 'Montserrat',
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.w200),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )

                        ,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(height: 64),
          // Articles section with 2 rows of 4 articles

          // Your article section (same as before)
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (paginatedArticles.isEmpty)
                    Center(
                      child: Text(
                        'Tidak ada artikel lain untuk kategori ini',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  else ...[
                    Wrap(
                      spacing: 61.0, // Horizontal space between articles
                      runSpacing: 20.0, // Vertical space between rows
                      children: [
                        // Create a list of article widgets
                        for (var article in paginatedArticles)
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 64) / 6,
                            child: ArticleCard(
                              imageUrl: article['imageUrl'],
                              title: article['title'],
                              description: article['description'],
                              publishDate: article['publishDate'],
                              readCount: article['readCount'],
                              category: article['category'],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleDetailPage(
                                      imageUrl: article['imageUrl'],
                                      title: article['title'],
                                      description: article['description'],
                                      publishDate: article['publishDate'],
                                      readCount: article['readCount'],
                                      category: article['category'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 64),

                    // Pagination controls
                    if (totalPages > 1)
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Previous button
                            if (currentPage > 1)
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isHoveredPrevious = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isHoveredPrevious = false;
                                  });
                                },
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      currentPage--;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isHoveredPrevious
                                        ? Color(0xFF0047BB)
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                  ),
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: isHoveredPrevious
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            SizedBox(width: 10),

                            // Page numbers
                            for (int i = 1; i <= totalPages; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      currentPage = i;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: currentPage == i
                                        ? Color(0xFF0047BB)
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    '$i',
                                    style: TextStyle(
                                      color: currentPage == i
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(width: 10),

                            // Next button with hover effect
                            if (currentPage < totalPages)
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isHoveredNext = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    isHoveredNext = false;
                                  });
                                },
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      currentPage++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isHoveredNext
                                        ? Color(0xFF0047BB)
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                  ),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: isHoveredNext
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(
            height: 164,
          ),
          Footer()
        ]),
      ),
    );
  }
}
