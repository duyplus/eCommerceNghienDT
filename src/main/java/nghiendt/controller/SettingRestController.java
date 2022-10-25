package nghiendt.controller;

import nghiendt.entity.Setting;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.SettingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/setting")
public class SettingRestController {
    @Autowired
    private SettingRepository settingRepository;

    @GetMapping
    public ResponseEntity<List<Setting>> getAllCompanies() {
        List<Setting> listContact = settingRepository.findAll();
        if (listContact.isEmpty()) {
            return new ResponseEntity<List<Setting>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Setting>>(listContact, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Setting> getCompaniesById(@PathVariable int id) {
        Setting setting = settingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact not exist with id: " + id));
        return ResponseEntity.ok(setting);
    }

    @PostMapping
    public Setting create(@RequestBody Setting setting) {
        return settingRepository.save(setting);
    }

    @PutMapping("{id}")
    public ResponseEntity<Setting> update(@PathVariable("id") int id, @RequestBody Setting setting) {
        Setting updateSetting = settingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact not exist with id: " + id));
        settingRepository.save(setting);
        return ResponseEntity.ok(updateSetting);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> delete(@PathVariable int id) {
        Setting setting = settingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Contact not exist with id: " + id));
        settingRepository.delete(setting);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
