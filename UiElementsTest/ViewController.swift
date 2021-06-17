//
//  ViewController.swift
//  UiElementsTest
//
//  Created by J. Ivan Martinez Mateos on 16/06/21.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    
    // Variables
    private let dataPicker = ["I love you Iliana 😘", "Te amo Iliana 🥰", "Je t'aime 😍"
    , "わたしは、あなたを愛しています ♥️"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Buttons
        titleButton.setTitle("I´m a title", for: .normal)
        titleButton.setTitleColor(.blue, for: .normal)
        
        // Pickers
        picker.dataSource = self
        picker.delegate = self
        
        // Page Control
        pageControl.numberOfPages = dataPicker.count
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .lightGray
        
        // Segment control
        segmentControl.removeAllSegments()
        for (index, message) in dataPicker.enumerated() {
            segmentControl.insertSegment(withTitle: message, at: index, animated: true)
        }
        
        // Slider
        slider.minimumTrackTintColor = .blue
        slider.maximumValue = Float(dataPicker.count)
        slider.minimumValue = 1
        slider.value=1
        
    }
    
    // Actions
    @IBAction func changeColorButton(_ sender: Any) {
        if titleButton.titleColor(for: .normal) == .blue {
            titleButton.setTitleColor(.red, for: .normal)
            pageControl.currentPageIndicatorTintColor = .red
            slider.minimumTrackTintColor = .red
        } else {
            titleButton.setTitleColor(.blue, for: .normal)
            pageControl.currentPageIndicatorTintColor = .blue
            slider.minimumTrackTintColor = .blue
        }
    }
    
    
    @IBAction func pageControlAction(_ sender: Any) {
        picker.selectRow(pageControl.currentPage, inComponent: 0, animated: true)
        
        segmentControl.selectedSegmentIndex = pageControl.currentPage
        
        let title = dataPicker[pageControl.currentPage]
        titleButton.setTitle(title, for: .normal)
    }
    
    
    @IBAction func actionSegmentControl(_ sender: Any) {
        picker.selectRow(segmentControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        pageControl.currentPage = segmentControl.selectedSegmentIndex
        
        let title = dataPicker[segmentControl.selectedSegmentIndex]
        titleButton.setTitle(title, for: .normal)
    }
    
    
    @IBAction func behavior(_ sender: Any) {
        let title: String;
        
        switch slider.value {
        case 1..<2:
            segmentControl.selectedSegmentIndex = 0
            title = dataPicker[0]
            titleButton.setTitle(title, for: .normal)
            picker.selectRow(0, inComponent: 0, animated: true)
            pageControl.currentPage = 0
        case 2..<3:
            segmentControl.selectedSegmentIndex = 1
            title = dataPicker[1]
            titleButton.setTitle(title, for: .normal)
            picker.selectRow(1, inComponent: 0, animated: true)
            pageControl.currentPage = 1
        case 3..<4:
            segmentControl.selectedSegmentIndex = 2
            title = dataPicker[2]
            titleButton.setTitle(title, for: .normal)
            picker.selectRow(2, inComponent: 0, animated: true)
            pageControl.currentPage = 2
        case 4..<5:
            segmentControl.selectedSegmentIndex = 3
            title = dataPicker[3]
            titleButton.setTitle(title, for: .normal)
            picker.selectRow(3, inComponent: 0, animated: true)
            pageControl.currentPage = 3
        default:
            segmentControl.selectedSegmentIndex = 4
            title = dataPicker[4]
            titleButton.setTitle(title, for: .normal)
            picker.selectRow(4, inComponent: 0, animated: true)
            pageControl.currentPage = 4
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataPicker[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleButton.setTitle(dataPicker[row], for: .normal)
        
        pageControl.currentPage = row
        
        segmentControl.selectedSegmentIndex = row
    }
}

