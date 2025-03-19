#import "lib.typ": thesis
#import "metadata.typ": *
#set document(title: "AI based Template Generation for Jayvee", author: "Lea Buchner")

#show: thesis.with(
    title: titleEnglish,
    titleGerman: titleGerman,
    degree: degree,
    supervisor: supervisor,
    author: author,
    faculty: faculty,
    professorship: professorship,
    professor: professor,
    submissionDate: "2 June 2025",
    abstract_en: include "/content/abstract_en.typ",
    abstract_de: "",
)

#include "/content/introduction.typ"

