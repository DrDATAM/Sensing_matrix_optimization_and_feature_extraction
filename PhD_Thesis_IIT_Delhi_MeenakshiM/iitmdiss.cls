%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a class for LaTeX2e that should format a report as per
% the IITM Thesis guidelines.  The page layout is set using the
% geometry package.  The double/singlespacing is setup using
% setspace.  Figure captions are set using the hang option of
% caption2.  natbib is used to do the citation using an
% author-year format. I've made an iitm.bst file that formats
% the references as per the IITM guidelines.
%
% To use this class do the following:
%  \documentclass[options]{iitmdiss}
%
% Options:
%
%   PhD, MS, MTech or BTech -- generates the appropriate title page
%   and loads the report class.
%
%   synopsis -- Generates the title page for the synopsis.  This also
%   loads the article class instead of the report.
%
% Example:
%
% \documentclass[PhD,synopsis]{iitmdiss}
% \documentclass[MS]{iitmdiss}
%
% IMPORTANT NOTICE:
%
%   PLEASE DO NOT MESS WITH THE MARGINS AND GENERAL FORMATTING SETUP
%   IN THIS FILE UNLESS YOU ARE ABSOLUTELY SURE THAT THE FORMAT DOES NOT
%   MATCH WITH THE THESIS GUIDELINES.  FOR EXAMPLE, DO NOT CHANGE THE
%   MARGINS AND SPACING JUST TO MAKE YOUR THESIS LARGER!
%
% Notes:
%
%   * I am using as much of the Thesis guidelines for the spacing
%     and margins as I can.
%   * I have used newdiss.cls by R.~K.~Hariram, U.~V.~Ravindra et al.
%     as a reference and a source for some of the macros.
%   * This class will assume a4paper with 12pt fonts.
%   * I am no TeXpert so feel free to clean up the mess.
%
% Prabhu Ramachandran <prabhu@ae.iitm.ac.in>
% March 2005.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{iitmdiss}[2005/03/09 Class for IIT-Madras Dissertations]

\newif\if@PhD
\newif\if@MS
\newif\if@MTech
\newif\if@BTech
\newif\if@Synopsis

\DeclareOption{PhD}{\@PhDtrue}
\DeclareOption{MS}{\@MStrue}
\DeclareOption{MTech}{\@MTechtrue}
\DeclareOption{BTech}{\@BTechtrue}
\DeclareOption{synopsis}{\@Synopsistrue}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Load the correct class.
\if@Synopsis
    \LoadClass[12pt,a4paper]{article}
\else
    \LoadClass[12pt,a4paper]{report}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry and page layout
%\RequirePackage[a4paper,left=1.5in,right=1in,top=1in,bottom=0.667in]{geometry}tmargin=1in,bmargin=0.667in,lmargin=1.5in,rmargin=1in
\RequirePackage[a4paper,tmargin=1in,bmargin=1in,lmargin=1in,rmargin=1in]{geometry}

\parskip 8pt

\renewcommand{\@pnumwidth}{2.5em}
%\renewcommand{\@tocrmarg}{2.5em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Using setspace to do the single/double spacing.  Setspace also
%% makes all tables and figures have single spacing automatically.
\RequirePackage{setspace}
\RequirePackage{atbeginend} % used to redefine the list environs
\setstretch{1.5}

\BeforeBegin{itemize}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{itemize}{\end{singlespace}}

\BeforeBegin{enumerate}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{enumerate}{\end{singlespace}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The figure captioning is done correctly via the hang option.
%%\RequirePackage[hang]{caption2}  -> TeX generates error
\RequirePackage[hang]{caption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%
% natbib allows easy switching of citation style and using it along
% with the iitm.bst makes things perfect.
%\RequirePackage[authoryear,round]{natbib}
%\RequirePackage{IEEEtran}
\bibliographystyle{IEEEtran}

%\newcommand{\bibstyle@IEEEtran}{\bibpunct{(}{)}{;}{a}{,}{,}%
%     \gdef\NAT@biblabel##1{##1. }}
%
%\setlength{\bibhang}{0pt}
%\citestyle{IEEEtran}
%\citestyle{unsrt_newen}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other useful macros.  Many of these are modifications from newdiss.cls

% \department{department name} -- user macro to declare name of department.
\def\department#1{\gdef\@department{#1}}

%\RequirePackage[dvips]{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The first title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\maketitlefirst{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \newpage
  \null
  \setcounter{page}{0}
  \parskip=0pt
  \begin{center}%
  \let \footnote \thanks
  \vglue 0in % this makes top margin 2in
  \vskip -5ex%
  \if@Synopsis
    {\large \em Synopsis of the Ph.D. Thesis\\ on \par}
  \fi
    {\Large \bf \expandafter{\@title} \par}%
    \vskip 10ex%
    {\normalsize
      \if@PhD
        \if@Synopsis
             
        \else 
            %{\em A THESIS }\par
            %\vskip 5ex%
        \fi
         
         \if@Synopsis
            { \em Submitted by \par}
         \else
            %{\normalsize \em submitted by \par}
         \fi
         \vskip 1.5in%
         {\bf \large{\@author} \par\par}
         \vskip 5ex%
         \if@Synopsis
         \else
            %{\em in fulfillment of the requirements of the degree }\par
         \fi
         \vskip 4ex%
         \if@Synopsis
         \else
            %{\em of} \par
            \vskip 4ex%
            %{\bf \large \MakeUppercase{Doctor of Philosophy}} \par
         \fi
       \else
         \if@MS
            {\em A THESIS }\par
            \vskip 5ex%
            {\normalsize \em submitted by \par}
            \vskip 5ex%
            {\bf \large\MakeUppercase{\@author}\par\par}
            \vskip 5ex%
            {\em for the award of the degree }\par
            \vskip 5ex%
            {\em of} \par
            \vskip 5ex%
            {\bf \large \MakeUppercase{Master Of Science}} \par
            (by Research) \par
         \else
           {\em A Project Report }\par
           \vskip 5ex%
           {\normalsize \em submitted by \par}
           \vskip 5ex%
           {\bf \large\MakeUppercase{\@author}\par\par}
           \vskip 5ex%
           {\normalsize \em in partial fulfilment of the requirements\par
             for the award of the degree of \par}
           \vskip 5ex%
           \if@MTech
             {\bf MASTER OF TECHNOLOGY}
           \fi
           \if@BTech
              {\bf BACHELOR OF TECHNOLOGY}
           \fi
         \fi
      \fi
    }
  \end{center}%

  \vspace*{0.3in}
  %\centerline{\psfig{figure=emblem.ps}}
%  \centerline{\includegraphics{iitm.eps}}
  \centerline{\includegraphics[scale=.2]{IITDlogoGrey}}
  \vskip 5ex%
  \vspace{0.3in}
  \begin{center}
    {\bf \large DEPARTMENT OF \@department\par}
    {\bf \large INDIAN INSTITUTE OF TECHNOLOGY DELHI}
    \vglue 0.50em
    {\bf \large \@date}\par
  \end{center}
  \parskip 8pt
}
%\newpage
%\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
%\def\endtitlepage{\newpage}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    The second title page    
%%%%%%%%%%%%%%%%%%%%%
\def\maketitlesecond{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \newpage
  \null
  \setcounter{page}{0}
  \parskip=0pt
  \begin{center}%
  \let \footnote \thanks
  \vglue 0in % this makes top margin 2in
  \vskip -5ex%
  \if@Synopsis
    {\large \em Synopsis of the Ph.D. Thesis\\ on \par}
  \fi
    {\Large \bf \expandafter{\@title} \par}%
    \vskip 8ex%
    {\normalsize
      \if@PhD
        \if@Synopsis
             
        \else 
            {\em by }\par
            \vskip 5ex%
        \fi
         
         \if@Synopsis
            %{ \em Submitted by \par}
         \else
            %{\normalsize \em submitted by \par}
         \fi
         %\vskip 3ex%
         {\bf \large{\@author} \par\par}
         \vskip 5ex%
         { DEPARTMENT OF ELECTRICAL ENGINEERING \par\par}
         \vskip 5ex%
         { Submitted \par\par}
         \vskip 5ex%
         \if@Synopsis
             {{\emph{under the guidance of}}} \\
            \vspace{.5cm}
            \hspace{.05cm} {\large \bf{Prof. Subrat Kar }}\ and \
            {\large \bf{Prof. Seshan Srirangarajan }}\\
         \else
            {\em in fulfilment of the requirements of the degree of Doctor of Philosophy \\ to the }\par
         \fi
         \vskip 4ex%
         \if@Synopsis
         \else
            {\em } \par
            \vskip 4ex%
            %{\bf \large \MakeUppercase{Doctor of Philosophy}} \par
         \fi
       \else
         \if@MS
            {\em A THESIS }\par
            \vskip 5ex%
            {\normalsize \em submitted by \par}
            \vskip 5ex%
            {\bf \large\MakeUppercase{\@author}\par\par}
            \vskip 5ex%
            {\em for the award of the degree }\par
            \vskip 5ex%
            {\em of} \par
            \vskip 5ex%
            {\bf \large \MakeUppercase{Master Of Science}} \par
            (by Research) \par
         \else
           {\em A Project Report }\par
           \vskip 5ex%
           {\normalsize \em submitted by \par}
           \vskip 5ex%
           {\bf \large\MakeUppercase{\@author}\par\par}
           \vskip 5ex%
           {\normalsize \em in partial fulfilment of the requirements\par
             for the award of the degree of \par}
           \vskip 5ex%
           \if@MTech
             {\bf MASTER OF TECHNOLOGY}
           \fi
           \if@BTech
              {\bf BACHELOR OF TECHNOLOGY}
           \fi
         \fi
      \fi
    }
  \end{center}%

  \vspace*{0.35in}
  %\centerline{\psfig{figure=emblem.ps}}
%  \centerline{\includegraphics{iitm.eps}}
  \centerline{\includegraphics[scale=.68]{IITDlogo_red.jpg}}
  \vspace*{0.25in}
  \begin{center}
   % {\bf \large DEPARTMENT OF \@department\par}
    {\bf \large INDIAN INSTITUTE OF TECHNOLOGY DELHI}
    \vglue 0.50em
    {\bf \large \@date}\par
  \end{center}
  \parskip 8pt
}

\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\newpage}

\if@Synopsis
   \renewcommand\refname{REFERENCES}
\else
   % QUOTATIONS
   %
   \def\quotations{\chapter*{\centerline{QUOTATIONS}}
   %\addcontentsline{toc}{chapter}{QUOTATIONS}
   }

   % DEDICATION
   %
   \def\dedication{\chapter*{\centerline{DEDICATION}}
   %\addcontentsline{toc}{chapter}{DEDICATION}
   }

   % CERTIFICATE
   %
   %   - this produces a certificate page as per IITM Regulations
   %     comment the following lines out to get it working.
   %
   \def\certificate{%% A preliminary chapter
     \clearpage
     \vspace*{36pt}
     \centerline{\Large \bf CERTIFICATE}
     \vskip 25pt
     \thispagestyle{empty}
     \typeout{Certificate}
     \setcounter{page}{0}
   }

   % ACKNOWLEDGEMENTS
   %
   \def\acknowledgements{\chapter*{\centerline{ACKNOWLEDGEMENTS}}
     \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
   }

   % ABSTRACT
   %   - this produces pages suitable for an IITM Abstract
   \def\abstract{\chapter*{\centerline{ABSTRACT}}
   \addcontentsline{toc}{chapter}{ABSTRACT}
   }

   % GLOSSARY
   %
   \def\glossary{\chapter*{\centerline{GLOSSARY}}
   \addcontentsline{toc}{chapter}{GLOSSARY}
   }

   % ABBREVIATIONS
   %
   \def\abbreviations{\chapter*{\centerline{ABBREVIATIONS}}
   \addcontentsline{toc}{chapter}{ABBREVIATIONS}
   }
   
   % ACRONYMS
   %
   \def\acronyms{\chapter
   *{\centerline{ACRONYMS}}
   \addcontentsline{toc}{chapter}{ACRONYMS}
   }

   % Use the nomencl package for the NOTATION section.

   % Makes the chapter heading
   \def\@makechapterhead#1{%
     {\parindent \z@ \raggedright \normalfont
       \ifnum \c@secnumdepth >\m@ne
        \vspace*{1.3in}
       \begin{flushleft}
         \LARGE\bfseries \@chapapp\space \thechapter
       \end{flushleft}
       \par\nobreak
       \vskip 20\p@
       \fi
       \interlinepenalty\@M
       \Large \bf
       \begin{flushleft}
        \Huge #1\par\nobreak 
       \end{flushleft}
       \vskip 20\p@
       \thispagestyle{empty}
     }}

   % Makes the chapter heading for \chapter* commands
   \def\@makeschapterhead#1{%
     \vspace*{25\p@}%
     {\parindent \z@ \raggedright
       \normalfont
       \interlinepenalty\@M
       \Large \bfseries #1\par\nobreak
       \vskip 20\p@
     }}


   %LIST OF PAPERS
   \def\listofpapers{
           \normalbaselines
           \chapter*{\centerline{LIST OF PUBLICATIONS}}
           \markboth{LIST OF PUBLICATIONS}{LIST OF PUBLICATIONS}
           \addcontentsline{toc}{chapter}{LIST OF PUBLICATIONS}
   }

 \def\references{
         
           \addcontentsline{toc}{chapter}{REFERENCES}
   }
   
   \def\biodata{
          \addcontentsline{toc}{chapter}{CURRICULUM VITAE}
   }
       %LIST OF PAPERS
   \def\listofpapersoutsidethesis{
           \normalbaselines
           \chapter*{\centerline{LIST OF PAPERS NOT BASED ON THESIS}}
           \markboth{LIST OF PAPERS NOT BASED ON THESIS}{LIST OF PAPERS NOT BASED ON THESIS}
           %\addcontentsline{toc}{chapter}{LIST OF PAPERS BASED ON THESIS}
   }


   % CV
   \def\CV{\chapter*{\centerline{CURRICULUM VITAE}}}

   % Comittee
   \if@PhD
       \def\committee{\chapter*{\centerline{DOCTORAL COMMITTEE}}}
   \else
       \if@MS
          \def\committee{\chapter*{\centerline{GENERAL TEST COMITTEE}}}}
        \fi
   \fi


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Renewed commands to set the titles of various pages correctly.
   \renewcommand\contentsname{\centering TABLE OF CONTENTS}
   \renewcommand\listfigurename{\centering LIST OF FIGURES}
   \renewcommand\listtablename{\centering LIST OF TABLES}
   \renewcommand{\chaptername}{CHAPTER}
   \renewcommand\bibname{\centering REFERENCES}
   \renewcommand\appendixname{APPENDIX}
\fi
