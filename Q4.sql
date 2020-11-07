-- Q4 (a) Creating education database
-- Database: `education`
--
-- --------------------------------------------------------
--
-- Table structure for table `course`
--
CREATE TABLE `course` (
  `courseid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `institution` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Table structure for table `institution`
--
CREATE TABLE `institution` (
  `institutionid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Table structure for table `student`
--
CREATE TABLE `student` (
  `studentid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `course` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Indexes for dumped tables
--
--
-- Indexes for table `course`
--
ALTER TABLE `course`
ADD PRIMARY KEY (`courseid`),
  ADD KEY `institution` (`institution`);
--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
ADD PRIMARY KEY (`institutionid`);
--
-- Indexes for table `student`
--
ALTER TABLE `student`
ADD PRIMARY KEY (`studentid`),
  ADD KEY `relationship` (`course`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
MODIFY `studentid` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `course`
--
ALTER TABLE `course`
ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`institution`) REFERENCES `institution` (`institutionid`);
--
-- Constraints for table `student`
--
ALTER TABLE `student`
ADD CONSTRAINT `relationship` FOREIGN KEY (`course`) REFERENCES `course` (`courseid`);
COMMIT;
-- 
-- 



-- Q4 (b) Query that display the number of students per course per institution
SELECT DISTINCT institution.name AS "INSTITUTION NAME",
  course.name AS "COURSE NAME",
  COUNT(*) AS "NUMBER OF STUDENTS"
FROM student
  JOIN course ON course.courseid = student.course
  JOIN institution ON institution.institutionid = course.institution
GROUP BY course;