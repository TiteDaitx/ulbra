package com.example.notes.controller;

import com.example.notes.model.Note;
import com.example.notes.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class NotaController {

    @Autowired
    NoteRepository noteRepository;
    //Recuperar todas as notas
    @GetMapping("/notes")
    public List<Note> getAllNotes(){
        return noteRepository.findAll();
    }
    @GetMapping("/notes/{id}")
    public Optional <Note> getById(@PathVariable(value = "id") Long id){
        return noteRepository.findById(id);
    }

    @DeleteMapping("/notes/{id}")
    public ResponseEntity<?> deleteNote(@PathVariable(value = "id") Long id){
        Optional <Note> note = noteRepository.findById(id);
        noteRepository.delete(note.get());
        return ResponseEntity.ok().build();
    }
    @PutMapping("/notes/{id}")
    public Note updateNote(@PathVariable(value = "id") Long id,
                           @Valid @RequestBody Note noteDetails){
        Optional<Note> note = noteRepository.findById(id);
        note.get().setTitle(noteDetails.getTitle());
        note.get().setContent(noteDetails.getContent());
        return noteRepository.save(note.get());
    }
    @PostMapping("/notes")
    public Note createNote(@Valid @RequestBody Note note){
        return noteRepository.save(note);
    }

}