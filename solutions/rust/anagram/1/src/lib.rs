use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let target = sorted_chars(word);
    let lowercase_word = word.to_lowercase();
    possible_anagrams
        .iter()
        .filter(|candidate| candidate.to_lowercase() != lowercase_word)
        .filter(|candidate| sorted_chars(candidate) == target)
        .copied().collect()
}

fn sorted_chars(word: &str) -> Vec<char> {
    let mut chars: Vec<char> = word.to_lowercase().chars().collect();
    chars.sort();
    chars
}
